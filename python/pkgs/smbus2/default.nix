{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "smbus2";
  version = "0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kplindegaard";
    repo = "smbus2";
    tag = finalAttrs.version;
    hash = "sha256-CWcRlbZTLiB45DaV6rbhvlk8cTaEJgPAq/JDmbxD7H4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "smbus2" ];

  meta = {
    description = "Drop-in replacement for smbus-cffi/smbus-python";
    homepage = "https://smbus2.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
