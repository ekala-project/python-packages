{
  lib,
  aiohttp,
  aioresponses,
  attrs,
  buildPythonPackage,
  defusedxml,
  fetchFromGitHub,
  freezegun,
  httpx,
  isodate,
  lxml,
  mock,
  packaging,
  platformdirs,
  pretend,
  pytest-asyncio,
  pytest-httpx,
  pytz,
  requests,
  requests-toolbelt,
  requests-file,
  requests-mock,
  setuptools,
  xmlsec,
}:

buildPythonPackage rec {
  pname = "zeep";
  version = "4.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mvantellingen";
    repo = "python-zeep";
    tag = version;
    hash = "sha256-0Mzvb86f1r07PCJqTy9CGUq9Zk2PtAsFfd3SmFlOayk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    defusedxml
    isodate
    lxml
    packaging
    platformdirs
    pytz
    requests
    requests-file
    requests-toolbelt
  ];

  optional-dependencies = {
    async = [ httpx ];
    xmlsec = [ xmlsec ];
  };

  pythonImportsCheck = [ "zeep" ];
  meta = {
    description = "Python SOAP client";
    homepage = "http://docs.python-zeep.org";
    license = lib.licenses.mit;
  };
}
