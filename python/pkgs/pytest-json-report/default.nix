{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest,
  pytest-metadata,
  pytest-xdist,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pytest-json-report";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "numirias";
    repo = "pytest-json-report";
    tag = "v${version}";
    hash = "sha256-hMB/atDuo7CjwhHFUOxVfgJ7Qp4AA9J428iv7hyQFcs=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ pytest-metadata ];
  pythonImportsCheck = [ "pytest_jsonreport" ];

  meta = {
    description = "Pytest plugin to report test results as JSON";
    homepage = "https://github.com/numirias/pytest-json-report";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
