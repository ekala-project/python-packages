{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "flatten-json";
  version = "0.1.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amirziai";
    repo = "flatten";
    rev = "v${finalAttrs.version}";
    hash = "sha256-ViOLbfJtFWkDQ5cGNYerTk2BqVg5f5B3hZ96t0uvhpk=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];
  pythonImportsCheck = [ "flatten_json" ];

  meta = {
    description = "Flatten JSON in Python";
    homepage = "https://github.com/amirziai/flatten";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
