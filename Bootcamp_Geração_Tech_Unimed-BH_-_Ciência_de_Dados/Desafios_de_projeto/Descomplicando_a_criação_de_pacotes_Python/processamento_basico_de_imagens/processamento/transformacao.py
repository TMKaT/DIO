from skimage.transform import resize

def redimensionar_imagem(img, proporcao):
    assert 0 <= proporcao <=1, "Especifique uma proporção entre 0 e 1."
    altura = round(img.shape[0]*proporcao)
    largura = round(img.shape[1]*proporcao)
    img_redimensionada = resize(img, (altura, largura), anti_aliasing=True)
    return img_redimensionada