{
  lib,
  buildPythonPackage,
  fetchurl,
  # build-system
  setuptools,
  glibcLocales,
}:

buildPythonPackage (finalAttrs: {
  pname = "rpmfluff";
  version = "0.5.7.1";
  pyproject = true;

  src = fetchurl {
    url = "https://releases.pagure.org/${pname}/${pname}-${finalAttrs.version}.tar.xz";
    sha256 = "19vnlzma8b0aghdiixk0q3wc10y6306hsnic0qvswaaiki94fss1";
  };

  build-system = [ setuptools ];

  env.LC_ALL = "en_US.utf-8";
  buildInputs = [ glibcLocales ];

  meta = {
    description = "Lightweight way of building RPMs, and sabotaging them";
    homepage = "https://pagure.io/rpmfluff";
    license = lib.licenses.gpl2;
  };
})
