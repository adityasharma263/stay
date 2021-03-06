"""empty message

Revision ID: ddf2681ba13c
Revises: f0e6294863ba
Create Date: 2019-06-30 13:55:11.978017

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'ddf2681ba13c'
down_revision = 'f0e6294863ba'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('amenity', sa.Column('airport_transfers', sa.Boolean(), nullable=True))
    op.add_column('facility', sa.Column('jacuzzi', sa.Integer(), nullable=True))
    op.add_column('room', sa.Column('lowest_price_room', sa.Boolean(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('room', 'lowest_price_room')
    op.drop_column('facility', 'jacuzzi')
    op.drop_column('amenity', 'airport_transfers')
    # ### end Alembic commands ###
