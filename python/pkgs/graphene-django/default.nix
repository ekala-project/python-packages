{ lib
, buildPythonPackage
, fetchFromGitHub
, graphene
, graphql-core
, django
, djangorestframework
, promise
, text-unidecode
, py
,
}:

buildPythonPackage rec {
  pname = "graphene-django";
  version = "3.2.3";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "graphene-django";
    tag = "v${version}";
    hash = "sha256-uMkzgXn3YRgEU46Sv5lg60cvetHir9bv0mzJGDv79DI=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner"' ""
  '';

  propagatedBuildInputs = [
    djangorestframework
    graphene
    graphql-core
    django
    promise
    text-unidecode
  ];

  meta = {
    description = "Integrate GraphQL into your Django project";
    homepage = "https://github.com/graphql-python/graphene-django";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
