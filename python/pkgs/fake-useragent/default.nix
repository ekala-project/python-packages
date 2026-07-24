{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "fake-useragent";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fake-useragent";
    repo = "fake-useragent";
    tag = version;
    hash = "sha256-CaFIXcS5y6m9mAfy4fniuA4VPTl6JfFq1WHnlLFz6fA=";
  };

  postPatch = ''
    sed -i '/addopts/d' pytest.ini
  '';

  build-system = [ setuptools ];
  pythonImportsCheck = [ "fake_useragent" ];

  disabledTests = lib.optionals (pythonOlder "3.12") [
    "test_utils_load_pkg_resource_fallback"
  ];

  meta = {
    description = "Up to date simple useragent faker with real world database";
    homepage = "https://github.com/hellysmile/fake-useragent";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
