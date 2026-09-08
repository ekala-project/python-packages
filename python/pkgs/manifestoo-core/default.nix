{
  buildPythonPackage,
  fetchPypi,
  lib,
  nix-update-script,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "manifestoo-core";
  version = "1.15.5";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "manifestoo_core";
    hash = "sha256-K1STpYG4m6JojWEAevB/VkP0fkSbbE5eaxINL0UfxPg=";
  };

  nativeBuildInputs = [ hatch-vcs ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Library to reason about Odoo addons manifests";
    homepage = "https://github.com/acsone/manifestoo-core";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
