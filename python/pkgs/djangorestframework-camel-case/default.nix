{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  djangorestframework,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "djangorestframework-camel-case";
  version = "1.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-za51hGZIq7ZYXHRwY5odL7Bk3EX46LYqqlC+fxp6YfQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ djangorestframework ];
  # tests are only on GitHub but there are no tags
  # https://github.com/vbabiy/djangorestframework-camel-case/issues/116

  pythonImportsCheck = [ "djangorestframework_camel_case" ];

  meta = {
    description = "Camel case JSON support for Django REST framework";
    homepage = "https://github.com/vbabiy/djangorestframework-camel-case";
    license = lib.licenses.bsd3;
  };
})
