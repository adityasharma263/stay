"""empty message

Revision ID: b13bcfe7e5fb
Revises: 22ece43e598c
Create Date: 2019-09-21 22:08:46.158488

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'b13bcfe7e5fb'
down_revision = '22ece43e598c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('hotel', sa.Column('email', sa.String(), nullable=True))
    op.add_column('hotel', sa.Column('locality', sa.String(), nullable=True))
    op.add_column('hotel', sa.Column('terrain', sa.String(), nullable=True))
    op.add_column('hotel', sa.Column('theme', sa.String(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('hotel', 'theme')
    op.drop_column('hotel', 'terrain')
    op.drop_column('hotel', 'locality')
    op.drop_column('hotel', 'email')
    # ### end Alembic commands ###