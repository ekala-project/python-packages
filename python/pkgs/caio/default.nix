{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "caio";
  version = "0.12.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mosquito";
    repo = "caio";
    tag = finalAttrs.version;
    hash = "sha256-iXrShoaMK39z47y0p0jwQQbQw3iz4cIS49cy6+G8x0k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "caio" ];

  meta = {
    description = "Python Async file IO library";
    homepage = "https://github.com/mosquito/caio";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
