{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-multipart";
  version = "0.0.32";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Kludex";
    repo = "python-multipart";
    tag = finalAttrs.version;
    hash = "sha256-zw6SHzbbjyRCGfUldxdki+wKwmTAgmd9ZAu/2zU+pFw=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "python_multipart" ];

  meta = {
    description = "Streaming multipart parser for Python";
    homepage = "https://github.com/Kludex/python-multipart";
    license = lib.licenses.asl20;
  };
})
