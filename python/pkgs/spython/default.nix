{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "spython";
  version = "0.3.15";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "singularityhub";
    repo = "singularity-cli";
    tag = finalAttrs.version;
    hash = "sha256-XYiudDXXiX0izFZZpQb71DBg/wRKjeupvKHixGFVuKM=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail '"pytest-runner"' ""
  '';

  build-system = [ setuptools ];
  pythonImportsCheck = [ "spython" ];
  meta = {
    description = "Streamlined singularity python client (spython) for singularity";
    homepage = "https://github.com/singularityhub/singularity-cli";
    license = lib.licenses.mpl20;
    maintainers = [ ];
    mainProgram = "spython";
  };
})
