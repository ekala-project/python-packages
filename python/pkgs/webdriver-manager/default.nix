{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  packaging,
  pybrowsers,
  pytest-cov-stub,
  python-dotenv,
  requests,
  selenium,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "webdriver-manager";
  version = "4.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SergeyPirogov";
    repo = "webdriver_manager";
    tag = "v${finalAttrs.version}";
    hash = "sha256-UQeiBtql0+IEG0iY0XoY+iqKqMB9Wmt+NxH7coxrJCw=";
  };
  build-system = [ setuptools ];

  dependencies = [
    packaging
    python-dotenv
    requests
  ];
  pythonImportsCheck = [ "webdriver_manager" ];
  meta = {
    description = "Module to manage the binary drivers for different browsers";
    homepage = "https://github.com/SergeyPirogov/webdriver_manager/";
    license = lib.licenses.asl20;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
})
