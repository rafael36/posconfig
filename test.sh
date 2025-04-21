# ---------- Instalação de pacotes do AUR ----------
mkdir -p /home/rafael/aur-builds
cd /home/rafael/aur-builds

repos_aur=(
  "google-chrome"
  "brave-bin"
  "parsec-bin"
  "ulauncher"
  "sunshine"
)

for repo in "${repos_aur[@]}"; do
    git clone https://aur.archlinux.org/$repo.git
    cd $repo && makepkg -si --noconfirm && cd ..
done

rm -rf /home/rafael/aur-builds