{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  py3dns,
}:

buildPythonPackage rec {
  pname = "pyspf";
  version = "2.0.14";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sdgathman";
    repo = "pyspf";
    tag = "pyspf-${version}";
    sha256 = "0bmimlmwrq9glnjc4i6pwch30n3y5wyqmkjfyayxqxkfrixqwydi";
  };

  dependencies = [ py3dns ];

  # requires /etc/resolv.conf to exist
  meta = {
    homepage = "http://bmsi.com/python/milter.html";
    description = "Python API for Sendmail Milters (SPF)";
    license = lib.licenses.gpl2;
  };
}
