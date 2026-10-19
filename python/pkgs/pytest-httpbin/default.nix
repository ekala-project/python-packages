{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpbin,
  pytest,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-httpbin";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kevin1024";
    repo = "pytest-httpbin";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gESU1SDpqSQs8GRcGJclWM0WpS4DZicfdtwxk2sQubQ=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ httpbin ];
  pythonImportsCheck = [ "pytest_httpbin" ];

  meta = {
    description = "Test your HTTP library against a local copy of httpbin.org";
    homepage = "https://github.com/kevin1024/pytest-httpbin";
    license = lib.licenses.mit;
  };
})
