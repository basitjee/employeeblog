import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LayoutpublicComponent } from './layoutpublic.component';

describe('LayoutpublicComponent', () => {
  let component: LayoutpublicComponent;
  let fixture: ComponentFixture<LayoutpublicComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LayoutpublicComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LayoutpublicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
