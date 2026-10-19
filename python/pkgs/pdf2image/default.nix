{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pillow,
  poppler-utils,
}:

buildPythonPackage (finalAttrs: {
  pname = "pdf2image";
  version = "1.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6qlZvBFrQg3X7EFfyuSbmBAN2j3RjNL9+obQnxEvbVc=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # replace all default values of paths to poppler-utils
    substituteInPlace pdf2image/pdf2image.py \
      --replace-fail 'poppler_path: Union[str, PurePath] = None' \
                     'poppler_path: Union[str, PurePath] = "${poppler-utils}/bin"'
  '';

  dependencies = [ pillow ];

  pythonImportsCheck = [ "pdf2image" ];

  meta = {
    description = "Module that wraps the pdftoppm utility to convert PDF to PIL Image object";
    homepage = "https://github.com/Belval/pdf2image";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
})
