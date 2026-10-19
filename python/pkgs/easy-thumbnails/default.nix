{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  pillow,
  reportlab,
  svglib,
  pytestCheckHook,
  pytest-django,
  setuptools,
  testfixtures,
}:

buildPythonPackage (finalAttrs: {
  pname = "easy-thumbnails";
  version = "2.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SmileyChris";
    repo = "easy-thumbnails";
    tag = finalAttrs.version;
    hash = "sha256-GPZ99OaQRSogS8gJXz8rVUjUeNkEk019TYx0VWa0Q6I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    pillow
  ];

  optional-dependencies.svg = [
    reportlab
    svglib
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-django
    testfixtures
  ]
  ++ lib.concatAttrValues finalAttrs.optional-dependencies;

  disabledTests = [
    # AssertionError: 'ERROR' != 'INFO'
    "test_postprocessor"
  ];

  preCheck = ''
    export DJANGO_SETTINGS_MODULE="easy_thumbnails.tests.settings"
  '';

  pythonImportsCheck = [ "easy_thumbnails" ];

  meta = {
    description = "Easy thumbnails for Django";
    homepage = "https://github.com/SmileyChris/easy-thumbnails";
    license = lib.licenses.bsd3;
  };
})
