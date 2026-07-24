{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "colored";
  version = "2.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-1rfwc3pzLFTJKycfKTLJHjhiOMi23tSdQYDu1E61BoQ=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "colored" ];

  meta = {
    description = "Simple library for color and formatting to terminal";
    homepage = "https://gitlab.com/dslackw/colored";
    license = lib.licenses.mit;
  };
}
