{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
  numpy,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "mnist";
  version = "0.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "datapythonista";
    repo = "mnist";
    rev = "${pname}-${finalAttrs.version}";
    sha256 = "17r37pbxiv5dw857bmg990x836gq6sgww069w3q5jjg9m3xdm7dh";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  nativeCheckInputs = [ pytestCheckHook ];

  # disable tests which fail due to socket related errors
  disabledTests = [
    "test_test_images_has_right_size"
    "test_test_labels_has_right_size"
    "test_train_images_has_right_size"
    "test_train_labels_has_right_size"
  ];

  meta = {
    description = "Python utilities to download and parse the MNIST dataset";
    homepage = "https://github.com/datapythonista/mnist";
    license = lib.licenses.bsd3;
  };
})
