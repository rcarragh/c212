library(tools)

rc = Rdiff("baseline/bh.10.dat", "test/bh.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/bh.dat", "test/bh.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/bonf.10.dat", "test/bonf.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/bonf.dat", "test/bonf.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/dfdr.10.dat", "test/dfdr.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/dfdr.dat", "test/dfdr.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/gbh.10.dat", "test/gbh.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/gbh.dat", "test/gbh.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/noadj.10.dat", "test/noadj.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/noadj.dat", "test/noadj.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/ssbh.10.dat", "test/ssbh.10.dat")
if (rc != 0) { stop("Error");  }
rc = Rdiff("baseline/ssbh.dat", "test/ssbh.dat")
if (rc != 0) { stop("Error");  }

