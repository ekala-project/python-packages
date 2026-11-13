{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "truststore";
  version = "0.10.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-MNNpZ8yt7Vy7ONYCxDP1NgADbHnVAvRTOkm2CgO7780=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "truststore" ];

  meta = {
    homepage = "https://github.com/sethmlarson/truststore";
    description = "Verify certificates using native system trust stores";
    license = lib.licenses.mit;
  };
})
