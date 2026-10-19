{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "wikipedia-api";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "martin-majlis";
    repo = "Wikipedia-API";
    tag = "v${finalAttrs.version}";
    hash = "sha256-kIZnKb0dzvXBgK1UNoG0gVIy5BvHnOjZbRo+xsLeQ/g=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];
  pythonImportsCheck = [ "wikipediaapi" ];

  meta = {
    description = "Python wrapper for Wikipedia";
    homepage = "https://github.com/martin-majlis/Wikipedia-API";
    license = lib.licenses.mit;
  };
})
