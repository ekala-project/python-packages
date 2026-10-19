{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "sarge";
  version = "0.1.8";
  pyproject = true;

  build-system = [ setuptools ];

  src = fetchFromGitHub {
    owner = "vsajip";
    repo = "sarge";
    tag = finalAttrs.version;
    hash = "sha256-//iAmcocP0VESkWgWR2k0D9/E7lgp5QKZ3CdzE54qmM=";
  };

  pythonImportsCheck = [ "sarge" ];

  meta = {
    description = "Python wrapper for subprocess which provides command pipeline functionality";
    homepage = "https://sarge.readthedocs.org/";
    license = lib.licenses.bsd3;
  };
})
