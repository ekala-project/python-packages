{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "laces";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tbrlpld";
    repo = "laces";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ELpPq7pqcLfAqUuHh8NOAOOiGPDImTFsA7WUHvVfMiI=";
  };

  nativeBuildInputs = [ flit-core ];

  dependencies = [ django ];

  pythonImportsCheck = [ "laces" ];

  meta = {
    description = "Django components that know how to render themselves";
    homepage = "https://github.com/tbrlpld/laces";
    license = lib.licenses.bsd3;
  };
})
