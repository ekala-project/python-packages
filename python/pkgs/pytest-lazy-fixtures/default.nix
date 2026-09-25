{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-lazy-fixtures";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dev-petrov";
    repo = "pytest-lazy-fixtures";
    tag = version;
    hash = "sha256-z4j9mITPUkug2/YaKwij5nlJYIoMpkDUPUmW/peNUXQ=";
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
  };
}
