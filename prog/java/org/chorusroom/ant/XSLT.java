/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 1999 The Apache Software Foundation.  All rights
 * reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution, if
 *    any, must include the following acknowlegement:
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowlegement may appear in the software itself,
 *    if and wherever such third-party acknowlegements normally appear.
 *
 * 4. The names "The Jakarta Project", "Ant", and "Apache Software
 *    Foundation" must not be used to endorse or promote products derived
 *    from this software without prior written permission. For written
 *    permission, please contact apache@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache"
 *    nor may "Apache" appear in their names without prior written
 *    permission of the Apache Group.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE APACHE SOFTWARE FOUNDATION OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

package org.chorusroom.ant;

import java.io.*;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.tools.ant.*;
import org.apache.tools.ant.types.*;
import org.apache.tools.ant.taskdefs.XSLTLiaison;
import org.apache.tools.ant.util.*;


/**
 * A Task to process via XSLT a set of XML documents. This is
 * useful for building views of XML based documentation.
 * arguments:
 * <ul>
 * <li>fromfile
 * <li>tofile
 * <li>style
 * </ul>
 * Of these arguments, the <b>sourcedir</b> and <b>destdir</b> are required.
 * <p>
 * This task will recursively scan the sourcedir and destdir
 * looking for XML documents to process via XSLT. Any other files,
 * such as images, or html files in the source directory will be
 * copied into the destination directory.
 *
 * @author <a href="mailto:kunishi@chorusroom.org">Takeo Kunishima</a>
 * @version $Id: XSLT.java,v 1.1 2001/12/10 04:03:16 kunishi Exp $
 */
public class XSLT extends Task {

  public class Param {
    private String name = null;
    private String expression = null;

    public void setName(String name) {
      this.name = name;
    }

    public void setExpression(String expression) {
      this.expression = expression;
    }

    public String getName() throws BuildException {
      if (name == null)
        throw new BuildException("Name attribute is missing.");
      return name;
    }

    public String getExpression() throws BuildException {
      if (expression == null)
        throw new BuildException("Expression attribute is missing.");
      return expression;
    }
  }

  protected File inFile = null;
  protected File outFile = null;
  protected File stylesheet = null;
  protected File destDir = null;
  protected File baseDir = null;
  protected Vector filesets = new Vector();

  protected boolean forceOverwrite = false;
  protected boolean stylesheetLoaded = false;
  protected int verbosity = Project.MSG_VERBOSE;

  protected String processor = "trax";
  protected Path classpath = null;
  protected XSLTLiaison liaison;
  protected String targetExtension = ".html";
  protected Vector params = new Vector();

  protected Hashtable fileProcessMap = new Hashtable();
  protected Mapper mapperElement = null;
  private FileUtils fileUtils;

  public XSLT() {
    fileUtils = FileUtils.newFileUtils();
  }

  protected FileUtils getFileUtils() {
    return fileUtils;
  }

  public void setFromfile(File inFile) {
    this.inFile = inFile;
  }

  public void setTofile(File outFile) {
    this.outFile = outFile;
  }

  public void setStyle(File stylesheetFile) {
    this.stylesheet = stylesheetFile;
  }

  public void setFromdir(File dir) {
    this.baseDir = dir;
  }

  public void setTodir(File dir) {
    this.destDir = dir;
  }

  public void setOverwrite(boolean overwrite) {
    this.forceOverwrite = overwrite;
  }

  public void setVerbose(boolean verbose) {
    if (verbose) {
      this.verbosity = Project.MSG_INFO;
    } else {
      this.verbosity = Project.MSG_VERBOSE;
    }
  }

  public void addFileset(FileSet set) {
    filesets.addElement(set);
  }

  public Mapper createMapper() throws BuildException {
    if (mapperElement != null) {
      throw new BuildException("Cannot define more than one mapper",
                               location);
    }
    mapperElement = new Mapper(project);
    return mapperElement;
  }

  public Param createParam() {
    Param p = new Param();
    params.addElement(p);
    return p;
  }

  public void setExtension(String name) {
    this.targetExtension = name;
  }

  private void resolveProcessor(String proc) throws Exception {
    final Class clazz =
      loadClass("org.apache.tools.ant.taskdefs.optional.TraXLiaison");
    liaison = (XSLTLiaison)clazz.newInstance();
  }

  private Class loadClass(String classname) throws Exception {
    if (classpath == null) {
      return Class.forName(classname);
    } else {
      AntClassLoader al = new AntClassLoader(project, classpath);
      Class c = al.loadClass(classname);
      AntClassLoader.initializeClass(c);
      return c;
    }
  }

  public void execute() throws BuildException {
    // make sure we don't have an illegal set of options.
    validateAttributes();

    // get an interface to Trax compatible XSLT processor.
    liaison = getLiaison();
    log("Using " + liaison.getClass().toString(), Project.MSG_VERBOSE);

    // deal with single file.
    if (inFile != null) {
      if (inFile.exists()) {
        if (outFile == null) {
          outFile = new File(destDir, inFile.getName());
        }

        if (forceOverwrite ||
            (inFile.lastModified() > outFile.lastModified()) ||
            (stylesheet.exists() &&
             (stylesheet.lastModified() > outFile.lastModified()))) {
          fileProcessMap.put(inFile.getAbsolutePath(), outFile.getAbsolutePath());
        } else {
          log(inFile + " omitted as " + outFile + " is up to date.",
              Project.MSG_VERBOSE);
        }
      } else {
        String message = "Could not find file " +
          inFile.getAbsolutePath() + " to process.";
        log(message);
        throw new BuildException(message, location);
      }
    }
    
    // deals with filesets
    for (int i = 0; i < filesets.size(); i ++) {
      FileSet fs = (FileSet) filesets.elementAt(i);
      DirectoryScanner ds = fs.getDirectoryScanner(project);
      File fromDir = fs.getDir(project);

      String[] srcFiles = ds.getIncludedFiles();
      String[] srcDirs = ds.getIncludedDirectories();

      scan(fromDir, destDir, srcFiles, srcDirs);
    }

    // do XSLT processes for all files.
    xsltProcess();

    // clean up destDir again - so this instance can be used a second
    // time without throwing an exception.
    if (outFile != null) {
      destDir = null;
    }

    return;
  }
  
  protected void validateAttributes() throws BuildException {
    if (inFile == null && filesets.size() == 0) {
      throw new BuildException("Specify at least one source - a file or a fileset.");
    }

    if (outFile == null && destDir == null) {
      throw new BuildException("One of destfile or destdir must be set.");
    }

    if (inFile != null && inFile.exists() && inFile.isDirectory()) {
      throw new BuildException("Use a fileset to process directories.");
    }

    if (outFile != null && filesets.size() > 0) {
      throw new BuildException("Cannot process multiple files into a single file.");
    }

    if (outFile != null) {
      destDir = new File(outFile.getParent()); // be 1.1 friendly.
    }

    if (stylesheet == null) {
      log("no stylesheet specified.", Project.MSG_VERBOSE);
    } else {
      if (!stylesheet.exists()) {
        stylesheet = fileUtils.resolveFile(baseDir, stylesheet.getName());
      }
    }
  }

  protected void scan(File fromDir, File toDir, String[] files, String[] dirs) {
    FileNameMapper mapper = null;
    if (mapperElement != null) {
      mapper = mapperElement.getImplementation();
    } else {
      mapper = new IdentityMapper();
    }

    buildMap(fromDir, toDir, files, mapper, fileProcessMap);
  }

  protected void buildMap(File fromDir, File toDir, String[] names,
                          FileNameMapper mapper, Hashtable map) {
    String[] toCopy = null;
    if (forceOverwrite) {
      Vector v = new Vector();
      for (int i = 0; i < names.length; i ++) {
        if (mapper.mapFileName(names[i]) != null) {
          v.addElement(names[i]);
        }
      }
      toCopy = new String[v.size()];
      v.copyInto(toCopy);
    } else {
      SourceFileScanner ds = new SourceFileScanner(this);
      toCopy = ds.restrict(names, fromDir, toDir, mapper);
    }

    for (int i = 0; i < toCopy.length; i ++) {
      File src = new File(fromDir, toCopy[i]);
      File dest = new File(toDir, mapper.mapFileName(toCopy[i])[0]);
      map.put(src.getAbsolutePath(), dest.getAbsolutePath());
    }
  }

  protected void xsltProcess() throws BuildException {
    if (fileProcessMap.size() > 0) {
      log("Processing " + fileProcessMap.size() +
          " file" + (fileProcessMap.size() == 1 ? "" : "s") +
          " to " + destDir.getAbsolutePath());

      Enumeration e = fileProcessMap.keys();
      while (e.hasMoreElements()) {
        String fromFile = (String) e.nextElement();
        String toFile = (String) fileProcessMap.get(fromFile);

        if (fromFile.equals(toFile)) {
          log("Skipping self-processing of " + fromFile, verbosity);
          continue;
        }

        try {
          log("Processing " + fromFile + " to " + toFile, verbosity);
          process(new File(fromFile), new File(toFile), stylesheet);
        } catch (BuildException ex) {
          throw new BuildException(ex, location);
        }
      }
    }
  }

  protected void process(File inFile, File outFile, File stylesheet)
    throws BuildException {
    try {
      log("In file " + inFile.getAbsolutePath()
          + " time: " + inFile.lastModified(), Project.MSG_DEBUG);
      log("Out file " + outFile.getAbsolutePath()
          + " time: " + outFile.lastModified(), Project.MSG_DEBUG);
      if (stylesheet != null) {
        log("Style file " + stylesheet.getAbsolutePath()
            + " time: " + stylesheet.lastModified(), Project.MSG_DEBUG);
      }

      if (stylesheet != null) {
        configureLiaison(stylesheet);
      }
      setLiaisonParams();
      ensureDirectoryFor(outFile);
      liaison.transform(inFile, outFile);
    } catch (Exception ex) {
      log("Failed to process " + inFile, Project.MSG_INFO);
      if (outFile != null)
        outFile.delete();
      throw new BuildException(ex, location);
    }
  }

  protected void ensureDirectoryFor(File targetFile) throws BuildException {
    File directory = new File(targetFile.getParent());
    if (!directory.exists()) {
      if (!directory.mkdirs()) {
        throw new BuildException("Unable to create directory: "
                                 + directory.getAbsolutePath());
      }
    }
  }

  protected XSLTLiaison getLiaison() {
    // if processor wasn't specified, see if TraX is available.  If not,
    // default it to xslp or xalan, depending on which is in the classpath
    if (liaison == null) {
      if (processor != null) {
        try {
          resolveProcessor(processor);
        } catch (Exception e) {
          throw new BuildException(e);
        }
      } else {
        try {
          resolveProcessor("trax");
        } catch (Throwable e1) {
          throw new BuildException(e1);
        }
      }
    }
    return liaison;
  }

  /**
   * Loads the stylesheet and set xsl:param parameters.
   */
  protected void configureLiaison(File stylesheet) throws BuildException {
    if (stylesheetLoaded) {
      return;
    }
    stylesheetLoaded = true;

    try {
      log("Loading stylesheet " + stylesheet, Project.MSG_INFO);
      liaison.setStylesheet(stylesheet);
    } catch (Exception ex) {
      log("Failed to read stylesheet " + stylesheet, Project.MSG_INFO);
      throw new BuildException(ex, location);
    }
  }

  protected void setLiaisonParams() throws BuildException {
    try {
      Enumeration e = params.elements();
      while (e.hasMoreElements()) {
        Param p = (Param)e.nextElement();
        log("adding parameters " + p.getName() + " with " + p.getExpression(),
            Project.MSG_INFO);
        liaison.addParam(p.getName(), p.getExpression());
      }
    } catch (Exception ex) {
      log("Failed to set parameters: ", Project.MSG_INFO);
      throw new BuildException(ex, location);
    }
  }
}
