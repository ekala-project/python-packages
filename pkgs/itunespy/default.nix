{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  requests,
  pycountry,
}:

buildPythonPackage rec {
  pname = "itunespy";
  version = "1.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sleepyfran";
    repo = "itunespy";
    tag = "v${version}";
    hash = "sha256-QvSKJAZa8v0tGURXwo4Dwo73JqsYs1xsBHW0lcaM7bk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    pycountry
  ];

  pythonImportsCheck = [ "itunespy" ];

  meta = {
    description = "Simple library to fetch data from the iTunes Store API";
    homepage = "https://github.com/sleepyfran/itunespy";
    license = lib.licenses.mit;
  };
}
