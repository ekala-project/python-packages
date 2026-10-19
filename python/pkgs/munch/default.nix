{
  lib,
  fetchPypi,
  buildPythonPackage,
  pbr,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "munch";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VCyxUUYSYyFqTjfD/Zr8Ql/urziqowJc0qmB+ttCIjU=";
  };

  env.PBR_VERSION = finalAttrs.version;

  nativeBuildInputs = [
    pbr
    setuptools
  ];

  pythonImportsCheck = [ "munch" ];

  meta = {
    description = "Dot-accessible dictionary (a la JavaScript objects)";
    homepage = "https://github.com/Infinidat/munch";
    license = lib.licenses.mit;
  };
})
