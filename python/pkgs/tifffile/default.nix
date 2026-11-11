{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tifffile";
  version = "2026.11.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-LdkWJ0Nl9Q0XMMyps3q5HBEr9T+iIwXGjclAvPTKrE0=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];
  pythonImportsCheck = [ "tifffile" ];

  # flaky, often killed due to OOM or timeout
  env.SKIP_LARGE = "1";

  meta = {
    description = "Read and write image data from and to TIFF files";
    homepage = "https://github.com/cgohlke/tifffile/";
    license = lib.licenses.bsd3;
  };
})
