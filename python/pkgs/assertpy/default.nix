{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "assertpy";
  version = "1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "assertpy";
    repo = "assertpy";
    tag = version;
    hash = "sha256-TmDnwYvOQIpjwBpMCCn+qg68HnKc0qzVP9fjygqBzkI=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "assertpy" ];

  meta = {
    description = "Simple assertion library for unit testing with a fluent API";
    homepage = "https://github.com/assertpy/assertpy";
    license = lib.licenses.bsd3;
  };
}
