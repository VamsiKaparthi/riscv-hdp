//#include<stdio.h>
void mat_display(int r,int c, int mat[r][c]){
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            //printf("%d ",mat[i][j]);
        }
        //printf("\n");
    }
}
int matrix_multiplication(int r1,int c1, int mat1[r1][c1], int r2,int c2, int mat2[r2][c2]){
    if(c1!=r2){
        //printf("Matrices are not compatible for multiplication");
        return 0;
    }
    int mat3[r1][c2];
    for(int i=0;i<r1;i++){
        for(int j=0;j<c2;j++){
            mat3[i][j]=0;
            for(int c=0;c<c1;c++){
                mat3[i][j]+=mat1[j][c]*mat2[c][j];
            }
        }
    }
    mat_display(r1,c2,mat3);
    return 1;
}
void main()
{
    int mat1[2][3] = {{1,1,1},{2,2,2}};
    int mat2[3][2] = {{1,1},{2,2},{3,3}};
    matrix_multiplication(2,3,mat1,3,2,mat2);
}
