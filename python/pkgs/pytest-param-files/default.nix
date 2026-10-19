{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  ruamel-yaml,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-param-files";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chrisjsewell";
    repo = "pytest-param-files";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hgEEfKf9Kmah5WDNHoFWQJKLOs9Z5BDHiebXCdDc1zE=";
  };

  nativeBuildInputs = [ flit-core ];

  buildInputs = [ pytest ];

  dependencies = [ ruamel-yaml ];

  pythonImportsCheck = [ "pytest_param_files" ];
  meta = {
    description = "Package to generate parametrized pytests from external files";
    homepage = "https://github.com/chrisjsewell/pytest-param-files";
    license = lib.licenses.mit;
  };
})
