{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, colorama
,
}:

buildPythonPackage (finalAttrs: {
  pname = "simber";
  version = "0.2.6";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "deepjyoti30";
    repo = "simber";
    tag = finalAttrs.version;
    hash = "sha256-kHoFZD7nhVxJu9MqePLkL7KTG2saPecY9238c/oeEco=";
  };

  build-system = [ setuptools ];

  dependencies = [ colorama ];

  pythonImportsCheck = [ "simber" ];

  meta = {
    description = "Simple, minimal and powerful logger for Python";
    homepage = "https://github.com/deepjyoti30/simber";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
