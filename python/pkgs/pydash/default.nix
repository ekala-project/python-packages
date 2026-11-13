{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  invoke,
  mock,
  pytest-cov-stub,
  setuptools,
  sphinx-rtd-theme,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydash";
  version = "8.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dgilland";
    repo = "pydash";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0EdZQqDOOSDk0EdLrQWSvNt/xIDt8iziPZkNNRfaYnU=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];
  pythonImportsCheck = [ "pydash" ];
  meta = {
    description = "Python utility libraries for doing stuff in a functional way";
    homepage = "https://pydash.readthedocs.io";
    license = lib.licenses.mit;
  };
})
