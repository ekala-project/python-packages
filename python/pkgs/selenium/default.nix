{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  certifi,
  trio,
  trio-websocket,
  trio-typing,
  typing-extensions,
  websocket-client,
  urllib3,
  python,
}:

buildPythonPackage rec {
  pname = "selenium";
  version = "4.40.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SeleniumHQ";
    repo = "selenium";
    tag = "selenium-${version}" + lib.optionalString (lib.versions.patch version != "0") "-python";
    hash = "sha256-Yfm2kpAmmEUP+m48PQf09UvFPeGBxd0ukqTtVah5h+E=";
  };

  patches = [ ./dont-build-the-selenium-manager.patch ];

  preConfigure = ''
    cd py
  '';

  postInstall = ''
    DST_PREFIX=$out/${python.sitePackages}/selenium/webdriver/
    DST_REMOTE=$DST_PREFIX/remote/
    DST_FF=$DST_PREFIX/firefox
    cp ../rb/lib/selenium/webdriver/atoms/getAttribute.js $DST_REMOTE
    cp ../rb/lib/selenium/webdriver/atoms/isDisplayed.js $DST_REMOTE
    cp ../rb/lib/selenium/webdriver/atoms/findElements.js $DST_REMOTE
    cp ../javascript/cdp-support/mutation-listener.js $DST_REMOTE
    cp ../third_party/js/selenium/webdriver.json $DST_FF/webdriver_prefs.json

    find $out/${python.sitePackages}/
  '';

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "certifi"
    "urllib3"
  ];

  dependencies = [
    certifi
    trio
    trio-websocket
    trio-typing
    typing-extensions
    urllib3
    websocket-client
  ]
  ++ urllib3.optional-dependencies.socks;

  pythonRemoveDeps = [
    "types-certifi"
    "types-urllib3"
  ];

  pythonImportsCheck = [ "selenium" ];

  meta = {
    description = "Bindings for Selenium WebDriver";
    homepage = "https://selenium.dev/";
    license = lib.licenses.asl20;
  };
}
