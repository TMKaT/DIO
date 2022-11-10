from skimage.io import inread, insave

def ler_imagem(caminho, is_gray = False):
    img = inread(caminho, as_gray = is_gray)
    return img

def savar_imagem(img, caminho):
    insave(caminho, img)