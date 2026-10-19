{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "filebrowser-safe";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "filebrowser_safe";
    inherit (finalAttrs) version;
    sha256 = "499c5dbd9e112dfc436cae7713b2fb664a59015021f6c9d131e3b7980aeb5c94";
  };

  build-system = [ setuptools ];

  buildInputs = [ django ];

  # There is no test embedded

  meta = {
    description = "Snapshot of django-filebrowser for the Mezzanine CMS";
    longDescription = ''
      filebrowser-safe was created to provide a snapshot of the
      FileBrowser asset manager for Django, to be referenced as a
      dependency for the Mezzanine CMS for Django.
    '';
    homepage = "https://github.com/stephenmcd/filebrowser-safe";
    downloadPage = "https://pypi.org/project/filebrowser_safe/";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.unix;
  };
})
