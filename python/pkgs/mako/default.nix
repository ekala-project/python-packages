{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,

  # build-system
  setuptools_80,

  # propagates
  markupsafe,

  # optional-dependencies
  babel,
  lingua,
}:

buildPythonPackage (finalAttrs: {
  pname = "mako";
  version = "1.3.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sqlalchemy";
    repo = "mako";
    tag = "rel_${lib.replaceString "." "_" finalAttrs.version}";
    hash = "sha256-YIMmP8CIGUlgnB8/96lR9yDvEZTES766dSN0vT0JfbM=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace-fail "tag_build = dev" ""
  '';

  build-system = [ setuptools_80 ];

  dependencies = [ markupsafe ];

  optional-dependencies = {
    babel = [ babel ];
    lingua = [ lingua ];
  };
  meta = {
    description = "Super-fast templating language";
    mainProgram = "mako-render";
    homepage = "https://www.makotemplates.org/";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
})
