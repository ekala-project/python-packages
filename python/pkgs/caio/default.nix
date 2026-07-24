{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "caio";
  version = "0.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mosquito";
    repo = "caio";
    tag = finalAttrs.version;
    hash = "sha256-IeyksrYpLMc9PJjpYeaOgLx26CeVMoR/3r2RX66ucDs=";
  };

  postPatch = ''
    substituteInPlace caio/version.py \
      --replace-fail 'version_info = (0, 9, 25)' 'version_info = (${
        lib.replaceString "." ", " finalAttrs.version
      })'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "caio" ];

  meta = {
    description = "Python Async file IO library";
    homepage = "https://github.com/mosquito/caio";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
