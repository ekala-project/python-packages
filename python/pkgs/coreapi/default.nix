{ lib
, fetchFromGitHub
, buildPythonPackage
, setuptools_80
, django
, coreschema
, itypes
, uritemplate
, requests
, standard-cgi
,
}:

buildPythonPackage rec {
  pname = "coreapi";
  version = "2.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "python-client";
    owner = "core-api";
    tag = version;
    hash = "sha256-nNUzQbBaT7woI3fmvPvIM0SVDnt4iC2rQ9bDgUeFzLA=";
  };

  build-system = [ setuptools_80 ];

  dependencies = [
    django
    coreschema
    itypes
    uritemplate
    requests
    standard-cgi
  ];

  meta = {
    description = "Python client library for Core API";
    homepage = "https://github.com/core-api/python-client";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
