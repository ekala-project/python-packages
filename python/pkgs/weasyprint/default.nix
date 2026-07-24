{
  lib,
  stdenv,
  pkgs,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch2,
  fontconfig,
  glib,
  harfbuzz,
  pango,

  # build-system
  flit-core,

  # dependencies
  cffi,
  cssselect2,
  fonttools,
  pillow,
  pydyf,
  pyphen,
  tinycss2,
  tinyhtml5,

  # tests
  replaceVars,
}:

buildPythonPackage (finalAttrs: {
  pname = "weasyprint";
  version = "69.0";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "Kozea";
    repo = "WeasyPrint";
    tag = "v${finalAttrs.version}";
    hash = "sha256-kd5ei3dBty8VL0ATPz8LZFP+UTUq7yTjuDtO1s/fdxg=";
  };

  patches = [
    (replaceVars ./library-paths.patch {
      fontconfig = "${fontconfig.lib}/lib/libfontconfig${stdenv.hostPlatform.extensions.sharedLibrary}";
      gobject = "${glib.out}/lib/libgobject-2.0${stdenv.hostPlatform.extensions.sharedLibrary}";
      harfbuzz = "${harfbuzz.out}/lib/libharfbuzz${stdenv.hostPlatform.extensions.sharedLibrary}";
      harfbuzz_subset = "${harfbuzz.out}/lib/libharfbuzz-subset${stdenv.hostPlatform.extensions.sharedLibrary}";
      pango = "${pango.out}/lib/libpango-1.0${stdenv.hostPlatform.extensions.sharedLibrary}";
      pangoft2 = "${pango.out}/lib/libpangoft2-1.0${stdenv.hostPlatform.extensions.sharedLibrary}";
    })
    (fetchpatch2 {
      name = "fix-unicode-test";
      url = "https://github.com/Kozea/WeasyPrint/commit/b2efb459fbe7f7fd35ab9078734121cb87d3d65a.patch?full_index=1";
      hash = "sha256-uixfpg9fvkdNmSTqz/M1c1vkV/mJDqOs7zDAunn2rEY=";
    })
  ];

  build-system = [ flit-core ];

  dependencies = [
    cffi
    cssselect2
    fonttools
    pillow
    pydyf
    pyphen
    tinycss2
    tinyhtml5
  ]
  ++ fonttools.optional-dependencies.woff;
  env.FONTCONFIG_FILE = "${fontconfig.out}/etc/fonts/fonts.conf";

  # Custom font configuration for tests
  # Set env variable explicitly for Darwin, but allow overriding when invoking directly
  makeWrapperArgs = [ "--set-default FONTCONFIG_FILE ${finalAttrs.env.FONTCONFIG_FILE}" ];

  pythonImportsCheck = [ "weasyprint" ];

  meta = {
    description = "Converts web documents to PDF";
    homepage = "https://weasyprint.org/";
    license = lib.licenses.bsd3;
    mainProgram = "weasyprint";
    maintainers = [ ];
  };
})
