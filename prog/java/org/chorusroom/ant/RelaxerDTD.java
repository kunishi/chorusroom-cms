package org.chorusroom.ant;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Vector;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteJava;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.taskdefs.PumpStreamHandler;
import org.apache.tools.ant.types.CommandlineJava;

/**
 * A task to use Relaxer as a DTD generator.
 * <p>
 * This taks can take the following arguments:
 * <ul>
 * </ul>
 *
 * @author <a href="mailto:kunishi@c.oka-pu.ac.jp">KUNISHIMA Takeo</a>
 * @version 1.0
 */
public class RelaxerDTD extends Java {

  protected String relaxFile = null;
  protected boolean verbose = false;
  protected String xmlBase = null;
  protected boolean useXMLNSURI = false;
  protected String verify = "none";
  protected String tagPrefix = "";
  protected boolean force = false;
  protected String targetExtension = ".dtd";
  protected final String relaxerClass = "jp.gr.java_conf.jaba2.Relaxer.Relaxer";

  protected File dir = null;
  protected File out;
  protected PrintStream outStream = null;
  protected CommandlineJava cmdl = new CommandlineJava();

  public int executeJava() throws BuildException {
    File inFile = new File(dir, relaxFile);
    File outFile = null;
    int dotPos = relaxFile.lastIndexOf('.');
    if (dotPos > 0) {
      outFile = new File(dir,
                         relaxFile.substring(0, dotPos) + targetExtension);
    } else {
      outFile = new File(dir, relaxFile + targetExtension);
    }

    if (force || !outFile.exists()
        || inFile.lastModified() > outFile.lastModified()) {
      log("Generating " + outFile + " from " + inFile, Project.MSG_INFO);
    
      cmdl.setClassname(relaxerClass);
      cmdl.createArgument().setLine(createParameters(inFile));
    
      log("Forking " + cmdl.toString(), Project.MSG_VERBOSE);
        
      return run(cmdl.getCommandline());
    } else {
      return 0;
    }
  }

  public void setRelaxFile(String file) {
    this.relaxFile = file;
  }

  public void setXmlBase(String uri) {
    this.xmlBase = uri;
  }

  public void setUseXMLNSURI(boolean useXMLNSURI) {
    this.useXMLNSURI = useXMLNSURI;
  }

  public void setVerify(String verify) {
    this.verify = verify;
  }

  public void setTagPrefix(String tagPrefix) {
    this.tagPrefix = tagPrefix;
  }
  
  public void setVerbose(boolean verbose) {
    this.verbose = verbose;
  }

  public void setForce(boolean force) {
    this.force = force;
  }

  public void setDir(File dir) {
    this.dir = dir;
  }

  protected String createParameters(File inFile) {
    Vector paramList = new Vector();

    paramList.add("-dtd");
    paramList.add("-grammarVerify:" + verify);
    if (verbose) {
      paramList.add("-verbose");
    }
    if (useXMLNSURI) {
      paramList.add("-useXMLNSURI");
    }
    if (!tagPrefix.equals("")) {
      paramList.add("-tagPrefix:" + tagPrefix);
    }
    
    paramList.add(inFile.toString());
    String s = "";
    for (int i = 0; i < paramList.size(); i ++) {
      s += (paramList.elementAt(i) + " ");
    }
    return s;
  }
  
  protected void run(CommandlineJava command) throws BuildException {
    ExecuteJava exe = new ExecuteJava();
    exe.setJavaCommand(command.getJavaCommand());
    exe.setClasspath(command.getClasspath());
    exe.setSystemProperties(command.getSystemProperties());
    if (out != null) {
      try {
        outStream = new PrintStream(new FileOutputStream(out));
        exe.execute(project);
      } catch (IOException io) {
        throw new BuildException(io, location);
      }
      finally {
        if (outStream != null) {
          outStream.close();
        }
      }
    }
    else {
      exe.execute(project);
    }
  }

  /**
   * Executes the given classname with the given arguments in a separate VM.
   */
  protected int run(String[] command) throws BuildException {
    FileOutputStream fos = null;
    try {
      Execute exe = null;
      if (out == null) {
        exe = new Execute(new LogStreamHandler(this, Project.MSG_INFO,
                                               Project.MSG_WARN), 
                          null);
      } else {
        fos = new FileOutputStream(out);
        exe = new Execute(new PumpStreamHandler(fos), null);
      }
            
      exe.setAntRun(project);
            
      if (dir == null) {
        dir = project.getBaseDir();
      } else if (!dir.exists() || !dir.isDirectory()) {
        throw new BuildException(dir.getAbsolutePath()+" is not a valid directory",
                                 location);
      }
            
      exe.setWorkingDirectory(dir);
            
      exe.setCommandline(command);
      try {
        return exe.execute();
      } catch (IOException e) {
        throw new BuildException(e, location);
      }
    } catch (IOException io) {
      throw new BuildException(io, location);
    } finally {
      if (fos != null) {
        try {
          fos.close();
        } catch (IOException io) {}
      }
    }
  }
}

