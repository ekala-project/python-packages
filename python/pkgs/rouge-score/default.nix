{
  lib,
  fetchPypi,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  absl-py,
  nltk,
  numpy,
  six,
}:
let
  testdata = fetchFromGitHub {
    owner = "google-research";
    repo = "google-research";
    sparseCheckout = [ "rouge/testdata" ];
    rev = "1d4d2f1aa6f2883a790d2ae46a6ee8ab150d8f31";
    hash = "sha256-ojqk6U2caS7Xz4iGUC9aQVHrKb2QNvMlPuQAL/jJat0=";
  };
in
buildPythonPackage (finalAttrs: {
  pname = "rouge-score";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "rouge_score";
    inherit (finalAttrs) version;
    extension = "tar.gz";
    hash = "sha256-x9TaJoPmjJq/ATXvkV1jpGZDZm+EjlWKG59+rRf/DwQ=";
  };

  # the tar file from pypi doesn't come with the test data
  postPatch = ''
    substituteInPlace rouge_score/test_util.py \
      --replace-fail \
        'os.path.join(os.path.dirname(__file__), "testdata")' \
        '"${testdata}/rouge/testdata/"'
  '';

  build-system = [ setuptools ];

  dependencies = [
    absl-py
    nltk
    numpy
    six
  ];
  pythonImportsCheck = [ "rouge_score" ];

  meta = {
    description = "Python ROUGE Implementation";
    homepage = "https://github.com/google-research/google-research/tree/master/rouge";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
