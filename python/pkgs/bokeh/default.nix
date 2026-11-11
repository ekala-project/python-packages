{
  lib,
  buildPythonPackage,
  fetchPypi,
  replaceVars,
  colorama,
  contourpy,
  jinja2,
  numpy,
  nodejs,
  packaging,
  pandas,
  pillow,
  tornado,
  pyyaml,
  setuptools,
  xyzservices,
  narwhals,
  toml,
}:

buildPythonPackage (finalAttrs: {
  pname = "bokeh";
  # update together with panel which is not straightforward
  version = "3.10.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-2fuhAE+uFJxubVS6N0EOUrjUYi7VxtrSIgr6G2E2LeA=";
  };

  patches = [
    (replaceVars ./hardcode-nodejs-npmjs-paths.patch {
      node_bin = "${nodejs}/bin/node";
      npm_bin = "${nodejs}/bin/npm";
    })
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', "setuptools-git-versioning"' "" \
      --replace-fail 'dynamic = ["version"]' 'version = "${finalAttrs.version}"'
  '';

  build-system = [
    colorama
    nodejs
    setuptools
  ];
  dependencies = [
    jinja2
    contourpy
    numpy
    packaging
    pandas
    pillow
    pyyaml
    tornado
    xyzservices
    narwhals
  ];

  pythonImportsCheck = [ "bokeh" ];

  meta = {
    description = "Statistical and novel interactive HTML plots for Python";
    mainProgram = "bokeh";
    homepage = "https://github.com/bokeh/bokeh";
    license = lib.licenses.bsd3;
  };
})
