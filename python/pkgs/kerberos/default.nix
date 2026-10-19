{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  libkrb5,
}:

buildPythonPackage rec {
  pname = "kerberos";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "cdd046142a4e0060f96a00eb13d82a5d9ebc0f2d7934393ed559bac773460a2c";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ libkrb5 ];

  meta = {
    description = "Kerberos high-level interface";
    homepage = "https://pypi.org/project/kerberos/";
    license = lib.licenses.asl20;
  };
}
