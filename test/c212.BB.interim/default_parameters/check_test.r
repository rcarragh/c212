library(tools)

rc = Rdiff("baseline/conv.dat", "test/conv.dat")
if (rc != 0) { stop("Error");  }

rc = Rdiff("baseline/summary.dat", "test/summary.dat")
if (rc != 0) { stop("Error");  }

rc = Rdiff("baseline/ptheta.dat", "test/ptheta.dat")
if (rc != 0) { stop("Error");  }

rc = Rdiff("baseline/ptheta80.dat", "test/ptheta80.dat")
if (rc != 0) { stop("Error");  }

rc = Rdiff("baseline/RAISED_AES", "test/RAISED_AES")
if (rc != 0) { stop("Error");  }
