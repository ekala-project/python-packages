{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-json-logger";
  version = "4.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nhairs";
    repo = "python-json-logger";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1ir27G7JWq/uOuzv7eOqdXOs8UFxWVeqoPRypysv0AU=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Json Formatter for the standard python logger";
    homepage = "https://github.com/madzak/python-json-logger";
    license = lib.licenses.bsdOriginal;
  };
})
