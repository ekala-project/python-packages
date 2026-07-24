{
  lib,
  stdenv,
  botocore,
  buildPythonPackage,
  cryptography,
  cssselect,
  defusedxml,
  fetchFromGitHub,
  glibcLocales,
  hatchling,
  httpx,
  installShellFiles,
  itemadapter,
  itemloaders,
  jmespath,
  lxml,
  packaging,
  parsel,
  pexpect,
  protego,
  pydispatcher,
  pyftpdlib,
  pyopenssl,
  pytest-asyncio,
  pytest-twisted,
  pytest-xdist,
  pythonAtLeast,
  queuelib,
  service-identity,
  setuptools,
  sybil,
  testfixtures,
  tldextract,
  twisted,
  uvloop,
  w3lib,
  zope-interface,
}:

buildPythonPackage rec {
  pname = "scrapy";
  version = "2.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scrapy";
    repo = "scrapy";
    tag = version;
    hash = "sha256-4FAZJZc8qsMn93XPNYnnbqecA29DWwh5VNNlCsnib7A=";
  };

  pythonRelaxDeps = [
    "defusedxml"
  ];

  build-system = [
    hatchling
  ];

  nativeBuildInputs = [
    installShellFiles
    setuptools
  ];

  dependencies = [
    cryptography
    cssselect
    defusedxml
    itemadapter
    itemloaders
    lxml
    packaging
    parsel
    protego
    pydispatcher
    pyopenssl
    queuelib
    service-identity
    tldextract
    twisted
    w3lib
    zope-interface
  ];
  env.LC_ALL = "en_US.UTF-8";
  postInstall = ''
    installManPage extras/scrapy.1
    installShellCompletion --cmd scrapy \
      --zsh extras/scrapy_zsh_completion \
      --bash extras/scrapy_bash_completion
  '';

  pythonImportsCheck = [ "scrapy" ];
  meta = {
    description = "High-level web crawling and web scraping framework";
    mainProgram = "scrapy";
    longDescription = ''
      Scrapy is a fast high-level web crawling and web scraping framework, used to crawl
      websites and extract structured data from their pages. It can be used for a wide
      range of purposes, from data mining to monitoring and automated testing.
    '';
    homepage = "https://scrapy.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
