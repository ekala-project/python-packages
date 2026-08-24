{ lib
, appdirs
, buildPythonPackage
, certifi
, fetchFromGitHub
, importlib-metadata
, poetry-core
, pyee
, tqdm
, urllib3
, websockets
,
}:

buildPythonPackage rec {
  pname = "pyppeteer";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyppeteer";
    repo = "pyppeteer";
    tag = version;
    hash = "sha256-LYyV4Wzz4faewSsGjNe0i/9BLbCHzzEns2ZL2MYkGWw=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    appdirs
    certifi
    importlib-metadata
    pyee
    tqdm
    urllib3
    websockets
  ];

  pythonRelaxDeps = [
    "pyee"
    "urllib3"
    "websockets"
  ];

  pythonImportsCheck = [ "pyppeteer" ];

  meta = {
    description = "Headless chrome/chromium automation library (unofficial port of puppeteer)";
    mainProgram = "pyppeteer-install";
    homepage = "https://github.com/pyppeteer/pyppeteer";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
