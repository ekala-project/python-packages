{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-lazy-fixtures";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dev-petrov";
    repo = "pytest-lazy-fixtures";
    tag = version;
    hash = "sha256-mKRWuRz8DDjdtG4Fx5Wcy5PIg2ao3+n9RFbiha7+f5I=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${version}"'
  '';

  build-system = [ hatchling ];

  dependencies = [ pytest ];

  pythonImportsCheck = [ "pytest_lazy_fixtures" ];

  meta = {
    description = "Allows you to use fixtures in @pytest.mark.parametrize";
    homepage = "https://github.com/dev-petrov/pytest-lazy-fixtures";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
