from django.db import models

# Create your models here.



class Atividade(models.Model):
    nome = models.CharField(max_length=100)
    is_finished = models.BooleanField(default=False)
    class Meta:
        verbose_name = 'Atividade'
        verbose_name_plural = 'Atividades'

    def __repr__(self):
        return f"Atividade:{self.nome}"
    
    def __str__(self):
        return self.nome        


class Tecnico(models.Model):
    nome = models.CharField(max_length=100)
    atividade = models.ForeignKey(Atividade, on_delete=models.CASCADE)    

    class Meta:
        verbose_name = 'Tecnico'
        verbose_name_plural = 'Tecnicos'

    def __repr__(self):
        return f"Tecnico:{self.nome}"
    
    def __str__(self):
        return self.nome
